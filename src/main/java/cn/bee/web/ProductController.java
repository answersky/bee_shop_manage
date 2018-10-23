package cn.bee.web;

import cn.bee.User;
import cn.bee.enumClass.ProductType;
import cn.bee.model.Product;
import cn.bee.model.ProductAttribute;
import cn.bee.model.ProductPic;
import cn.bee.service.IProductService;
import cn.bee.service.LogRecordService;
import cn.bee.utils.JSONUtil;
import cn.bee.utils.Properties;
import cn.bee.utils.ResponseResult;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

/**
 * created by liufeng
 * 2018/9/20
 */
@Controller
public class ProductController {
    @Resource
    private IProductService productService;
    @Resource
    private LogRecordService logRecordService;

    private Logger log = LoggerFactory.getLogger(ProductController.class);


    @RequestMapping("/productList")
    public String productList() {
        return "product/productList";
    }

    @RequestMapping("/findProductList")
    @ResponseBody
    public String findProductList() {
        Map<String, Object> result = new LinkedHashMap<>();
        List<Product> products = new ArrayList<>();
        Map<String, Object> param = new LinkedHashMap<>();
        Map<String, Object> map = productService.queryAll(param);
        if ("success".equals(map.get("status"))) {
            products = (List<Product>) map.get("data");
        }
        result.put("data", products);
        return JSONUtil.object2String(result);
    }

    @RequestMapping("/addProduct")
    public String addProduct(Model model) {
        ProductType[] arr = ProductType.values();
        model.addAttribute("types", arr);
        return "product/add_product";
    }

    @RequestMapping("/product/fileUpload")
    @ResponseBody
    public String fileUpload(MultipartFile file, String imgUrl, HttpServletRequest request, HttpServletResponse response) {
        String url = null;
        //文件存放的路径
        String path = getFilePath("save_img_path");
        String host = getFilePath("visit_img_url");
        //判断图片存在删除原有的图片
        if (imgUrl != null) {
            String filename = imgUrl.replace(host, "");
            deleteFile(path + filename);
        }

        if (!file.isEmpty()) {
            FileOutputStream fos = null;
            try {
                String fName = "";
                String orgiginalFileName = file.getOriginalFilename();
                if (orgiginalFileName.contains(".")) {
                    int indexdot = orgiginalFileName.indexOf(".");
                    String suffix = orgiginalFileName.substring(indexdot);
                    String uuid = UUID.randomUUID().toString();
                    fName = uuid + suffix;
                }
                byte[] bytes = file.getBytes();
                fos = new FileOutputStream(path + fName);
                fos.write(bytes);
                url = host + fName;

            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (fos != null) {
                        fos.close();
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return url;
    }

    private void deleteFile(String fileName) {
        File file = new File(fileName);
        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
        if (file.exists() && file.isFile()) {
            if (file.delete()) {
                log.info("删除单个文件" + fileName + "成功！");
            } else {
                log.error("删除单个文件" + fileName + "失败！");
            }
        }
    }

    private String getFilePath(String key) {
        Properties properties = new Properties();
        try {
            properties.load();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return properties.getValue(key);
    }

    @ResponseBody
    @RequestMapping("/product/createProduct")
    public String createProduct(HttpServletRequest request) {
        ResponseResult result = new ResponseResult();
        try {
            User user = (User) SecurityUtils.getSubject().getPrincipal();
            String username = user.getName();
            Date createTime = new Date();
            String productCode = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10);
            String productJson = request.getParameter("product");
            Product product = (Product) JSONUtil.jsonStr2Object(productJson, Product.class);
            product.setProductCode(productCode);
            product.setOperator(username);
            product.setCreateTime(createTime);
            log.info("商品信息：" + product);
            String productAttrJson = request.getParameter("productAttr");
            ProductAttribute productAttribute = (ProductAttribute) JSONUtil.jsonStr2Object(productAttrJson, ProductAttribute.class);
            productAttribute.setCreateTime(createTime);
            log.info("商品属性信息：" + productAttribute);
            String productPicJson = request.getParameter("productPic");
            ProductPic productPic = (ProductPic) JSONUtil.jsonStr2Object(productPicJson, ProductPic.class);
            log.info("商品图片信息：" + productPic);
            product.setProductAttribute(productAttribute);
            product.setProductPic(productPic);
            productService.addProduct(product);
            result.setStatus("200");
            result.setMessage("商品创建成功");

            //记录商品操作日志
            String remark = "账户：" + username + " 新建商品productCode:" + productCode + " 状态：0";
            logRecordService.saveProductOperateLog(username, productCode, remark);
        } catch (Exception e) {
            result.setStatus("505");
            result.setMessage("商品创建失败");
            e.printStackTrace();
        }
        return JSONUtil.object2String(result);
    }


}
