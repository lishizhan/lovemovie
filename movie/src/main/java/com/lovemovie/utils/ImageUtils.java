package com.lovemovie.utils;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.UUID;

/**
 * @Author : Alishiz
 * @Date : 2021/4/23/0023 22:01
 * @email : 1575234570@qq.com
 * @Description : 处理图片的工具类
 */
public class ImageUtils {

    /**
     *
     * @Description: 返回上传图片的路径
     *
     * @auther: lishizhan
     * @data: 22:05 2021/4/23/0023
     * @param:
     * @return:
     *
     */
    public static String upload(HttpServletRequest request,MultipartFile picture) throws Exception {
        //定义图片路径
        String imgPath=null;

        if (!picture.isEmpty()&&picture!=null){
            //使用UUID给图片重命名
            String name= UUID.randomUUID().toString().replaceAll("-","");
            //获取文件扩展名
            String ext= FilenameUtils.getExtension(picture.getOriginalFilename());
            //设置图片上传路径
            String url = request.getSession().getServletContext().getRealPath("/upload");
            //判断文件夹是否存在
            File file = new File(url);
            if (!file.exists()){
                file.mkdirs();
            }
            //以绝对路径保存图片路径
            picture.transferTo(new File(url+"/"+ name+"."+ext));

            imgPath="upload/"+ name+"."+ext;
        }

        return imgPath;
    }


}
