package cn.bee.service.impl;

import cn.bee.model.ProductOperateLog;
import cn.bee.service.LogRecordService;
import cn.bee.service.log.IProductOperateLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * created by liufeng
 * 2018/10/23
 */
@Service
public class LogRecordServiceImpl implements LogRecordService {
    @Resource
    private IProductOperateLogService productOperateLogService;

    @Override
    public void saveProductOperateLog(String operator, String productCode, String remark) {
        ProductOperateLog productOperateLog = new ProductOperateLog();
        productOperateLog.setOperator(operator);
        productOperateLog.setProductCode(productCode);
        productOperateLog.setRemark(remark);
        productOperateLogService.saveLog(productOperateLog);
    }
}
