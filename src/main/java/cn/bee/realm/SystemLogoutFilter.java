package cn.bee.realm;

import org.apache.shiro.session.SessionException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.springframework.stereotype.Service;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * created by liufeng
 * 2018/9/17
 */
@Service
public class SystemLogoutFilter extends LogoutFilter {

    @Override
    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
        String redirectUrl = "/login";
        Subject subject = getSubject(request, response);
        try {
            subject.logout();
        } catch (SessionException e) {
            e.printStackTrace();
        }
        issueRedirect(request, response, redirectUrl);
        return false;
    }
}
