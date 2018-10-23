package cn.bee.service;

/**
 * created by liufeng
 * 2018/10/23
 */
public interface LogRecordService {
    /**
     * 记录商品的操作日志
     *
     * @param operator
     * @param productCode
     * @param remark
     */
    void saveProductOperateLog(String operator, String productCode, String remark);
}
