/**
！
 */
package ltd.newbee.mall.controller.admin;

import ltd.newbee.mall.common.ServiceResultEnum;
import ltd.newbee.mall.controller.vo.NewBeeMallOrderItemVO;
import ltd.newbee.mall.controller.vo.StatisticsVo;
import ltd.newbee.mall.entity.NewBeeMallOrder;
import ltd.newbee.mall.service.NewBeeMallOrderService;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.Result;
import ltd.newbee.mall.util.ResultGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

/**

 */
@Controller
@RequestMapping("/admin")
public class NewBeeMallOrderController {

    @Resource
    private NewBeeMallOrderService newBeeMallOrderService;

    @GetMapping("/orders")
    public String ordersPage(HttpServletRequest request) {
        request.setAttribute("path", "orders");
        return "admin/newbee_mall_order";
    }

    /**
     * 列表
     */
    @RequestMapping(value = "/orders/list", method = RequestMethod.GET)
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params) {
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(newBeeMallOrderService.getNewBeeMallOrdersPage(pageUtil));
    }

    /**
     * 修改
     */
    @RequestMapping(value = "/orders/update", method = RequestMethod.POST)
    @ResponseBody
    public Result update(@RequestBody NewBeeMallOrder newBeeMallOrder) {
        if (Objects.isNull(newBeeMallOrder.getTotalPrice())
                || Objects.isNull(newBeeMallOrder.getOrderId())
                || newBeeMallOrder.getOrderId().doubleValue() < 1
                || newBeeMallOrder.getTotalPrice().doubleValue() < 1
                || StringUtils.isEmpty(newBeeMallOrder.getUserAddress())) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        String result = newBeeMallOrderService.updateOrderInfo(newBeeMallOrder);
        if (ServiceResultEnum.SUCCESS.getResult().equals(result)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult(result);
        }
    }

    /**
     * 详情
     */
    @GetMapping("/order-items/{id}")
    @ResponseBody
    public Result info(@PathVariable("id") Long id) {
        List<NewBeeMallOrderItemVO> orderItems = newBeeMallOrderService.getOrderItems(id);
        if (!CollectionUtils.isEmpty(orderItems)) {
            return ResultGenerator.genSuccessResult(orderItems);
        }
        return ResultGenerator.genFailResult(ServiceResultEnum.DATA_NOT_EXIST.getResult());
    }

    /**
     * 配货
     */
    @RequestMapping(value = "/orders/checkDone", method = RequestMethod.POST)
    @ResponseBody
    public Result checkDone(@RequestBody Long[] ids) {
        if (ids.length < 1) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        String result = newBeeMallOrderService.checkDone(ids);
        if (ServiceResultEnum.SUCCESS.getResult().equals(result)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult(result);
        }
    }

    /**
     * 出库
     */
    @RequestMapping(value = "/orders/checkOut", method = RequestMethod.POST)
    @ResponseBody
    public Result checkOut(@RequestBody Long[] ids) {
        if (ids.length < 1) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        String result = newBeeMallOrderService.checkOut(ids);
        if (ServiceResultEnum.SUCCESS.getResult().equals(result)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult(result);
        }
    }

    /**
     * 关闭订单
     */
    @RequestMapping(value = "/orders/close", method = RequestMethod.POST)
    @ResponseBody
    public Result closeOrder(@RequestBody Long[] ids) {
        if (ids.length < 1) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        String result = newBeeMallOrderService.closeOrder(ids);
        if (ServiceResultEnum.SUCCESS.getResult().equals(result)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult(result);
        }
    }


    @GetMapping("/statisticsView")
    public String statisticsView() {
        return "admin/newbee_mall_goods_statistics";
    }


    @GetMapping("/statistics")
    @ResponseBody
    public Result statistics() {
        List<StatisticsVo> statisticsVos = newBeeMallOrderService.statistics();

        Map<String, Object> result = new HashMap<>();

        if (!CollectionUtils.isEmpty(statisticsVos)) {

            Map<String, Object> seriesNameMap = new HashMap<>();
            Map<String, Object> seriesMap = new HashMap<>();
            List<Map<String, Object>> seriesListMap = new ArrayList<>();

            seriesNameMap.put("name", statisticsVos.get(0).getYearMonth());

            Map<String, Object> yAxisMap = new HashMap<>(statisticsVos.size());
            yAxisMap.put("type", "category");

            List<String> yAxisData = new ArrayList(statisticsVos.size());
            List<Integer> seriesData = new ArrayList(statisticsVos.size());

            int index = 1;
            for (StatisticsVo statisticsVo : statisticsVos) {
                ++index;
                if (seriesNameMap.containsValue(statisticsVo.getYearMonth())) {
                    seriesData.add(statisticsVo.getSales());


                    if (statisticsVos.size() == 1 || index >= statisticsVos.size()) {
                        seriesMap.put("name", seriesNameMap.get("name"));
                        seriesMap.put("type", "bar");
                        seriesMap.put("data", seriesData);
                        seriesListMap.add(seriesMap);
                    }
                } else {
                    seriesMap.put("name", seriesNameMap.get("name"));
                    seriesMap.put("type", "bar");
                    seriesMap.put("data", seriesData);
                    seriesListMap.add(seriesMap);

                    seriesNameMap.put("name", statisticsVo.getYearMonth());
                    seriesData = new ArrayList<>();
                    seriesMap = new HashMap<>();

                    if (index >= statisticsVos.size()) {
                        seriesData.add(statisticsVo.getSales());

                        seriesMap.put("name", seriesNameMap.get("name"));
                        seriesMap.put("type", "bar");
                        seriesMap.put("data", seriesData);
                        seriesListMap.add(seriesMap);
                    }
                }
                yAxisData.add(statisticsVo.getGoodName());

            }
            yAxisMap.put("data", yAxisData);

            result.put("series", seriesListMap);
            result.put("yAxis", yAxisMap);
        } else {
            result.put("series", new ArrayList<Map<String, Object>>());
            result.put("yAxis", new HashMap<String, Object>());
        }
        return ResultGenerator.genSuccessResult(result);
    }

}