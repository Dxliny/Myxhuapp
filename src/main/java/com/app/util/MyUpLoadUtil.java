package com.app.util;/*
 *@Author:dxlin
 *@Description：
 *@Date: 2018-3-
 */

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class MyUpLoadUtil {

    public static String upload(CommonsMultipartFile file, HttpServletRequest request){
        File targetFile = null;

        String filename = file.getOriginalFilename();
        String fileType = filename.substring(filename.lastIndexOf("."),filename.length());
        String filenewname = new Date().getTime()+"_"+new Random().nextInt(1000)+fileType;
        String path = request.getSession().getServletContext().getRealPath("upload/imgs/dynamic_images/");
        String dateStr = new SimpleDateFormat("yyyMMdd").format(new Date());

        String httpStr = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"
                + request.getContextPath()+"upload/imgs/dynamic_images/"+dateStr+"/"+filenewname;

        File fileTimeMkd = new File(path+dateStr+"/");
        if(!fileTimeMkd.exists()&&!fileTimeMkd.isDirectory()){
            fileTimeMkd.mkdir();
        }
        try {
            targetFile = new File(fileTimeMkd,filenewname);
            file.transferTo(targetFile);
        }catch (Exception e){
            System.out.println("error");
        }
        return httpStr;
    }
}
