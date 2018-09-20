package cn.bee.web;

import cn.bee.enumClass.ProductType;
import cn.bee.model.Product;
import cn.bee.utils.JSONUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.util.*;

/**
 * created by liufeng
 * 2018/9/20
 */
@Controller
public class ProductController {


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

}
