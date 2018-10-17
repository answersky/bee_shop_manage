package cn.bee.web;

import cn.bee.User;
import cn.bee.service.UserValidateService;
import cn.bee.utils.JSONUtil;
import cn.bee.utils.Md5Encrypt;
import cn.bee.utils.ResponseResult;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

/**
 * @author answer
 * 2018/4/12
 */
@Controller
public class LoginController {
    @Resource
    private UserValidateService userValidateService;

    private Logger log = LoggerFactory.getLogger(LoginController.class);

    @RequestMapping("/validate")
    @ResponseBody
    public String login(Model model, String username, String password) {
        ResponseResult responseResult = new ResponseResult();
        User user = userValidateService.findByUsername(username);
        log.info("用户：" + user);
        if (user == null) {
            responseResult.setMessage("用户不存在");
            responseResult.setStatus("400");
            return JSONUtil.object2String(responseResult);
        }
        String uuid = user.getUuid();
        String pass = null;
        try {
            pass = Md5Encrypt.EncoderByMd5(uuid, password);
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        UsernamePasswordToken token = new UsernamePasswordToken(username, pass);
        // shiro登陆验证
        try {
            SecurityUtils.getSubject().login(token);
            //设置登录超时时长 2小时
            SecurityUtils.getSubject().getSession().setTimeout(7200000);
            responseResult.setMessage("登录成功");
            responseResult.setStatus("200");
        } catch (UnknownAccountException ex) {
            responseResult.setMessage("用户不存在");
            responseResult.setStatus("400");
        } catch (IncorrectCredentialsException ex) {
            responseResult.setMessage("密码错误");
            responseResult.setStatus("400");
        } catch (AuthenticationException ex) {
            responseResult.setMessage("系统异常");
            responseResult.setStatus("400");
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
            responseResult.setMessage("系统异常");
            responseResult.setStatus("400");
        }
        return JSONUtil.object2String(responseResult);
    }

}
