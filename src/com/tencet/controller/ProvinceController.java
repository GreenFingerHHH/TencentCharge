package com.tencet.controller;

import com.tencet.dao.ProvinceDao;
import com.tencet.pojo.Province;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/province")
public class ProvinceController {

    @Autowired
    private ProvinceDao provinceDao;

    @RequestMapping("/getAll")
    @ResponseBody
    public void getAllProvince(HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("provinces")==null){
            session.setAttribute("provinces",provinceDao.selectProvince());
        }
    }


}
