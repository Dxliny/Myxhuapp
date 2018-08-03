package com.app.controller;/*
 *@Author:dxlin
 *@Description：
 *@Date: 2018-3-
 */


import com.app.dao.IInterestTimesDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping(value = "/test")
public class testController {
    @Resource
    private IInterestTimesDao interestTimes;

    @RequestMapping(value = "/hello",method = {RequestMethod.GET,RequestMethod.POST},
                        produces = "text/json;charset=UTF-8")
    @ResponseBody
    public void testHello(int user_id_f){

    }

}
