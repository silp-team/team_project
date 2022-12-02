package com.example.parking;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping("/")    //핸들러 매핑, 루트의 주소를 줌 알아서 호출함
    public String index(){
        System.out.println("request index");

        return "index";
    }
}
