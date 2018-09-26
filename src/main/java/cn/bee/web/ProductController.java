package cn.bee.web;

import cn.bee.enumClass.ProductType;
import cn.bee.model.Product;
import cn.bee.service.IProductService;
import cn.bee.utils.JSONUtil;
import cn.bee.utils.Properties;
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
import java.math.BigDecimal;
import java.util.*;

/**
 * created by liufeng
 * 2018/9/20
 */
@Controller
public class ProductController {
    @Resource
    private IProductService productService;

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
        Product product = new Product();
        product.setProductCode("aaabbbccc");
        product.setProductName("北京方便面");
        product.setProductType(String.valueOf(ProductType.FOOD));
        product.setPic("https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1537411867&di=e401d45f7a8a7944579b9e193595f0b6&src=http://upload.00007.com/upload/images/3870901bf29908a1.jpg");
        product.setPrice(new BigDecimal(1.0));
        product.setInventory(200);
        product.setSort(1);
        product.setOperator("admin");
        product.setCreateTime(new Date());
        products.add(product);
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

}
