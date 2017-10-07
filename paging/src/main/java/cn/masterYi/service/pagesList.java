package cn.masterYi.service;

import java.util.List;

import cn.masterYi.entity.pageList;

public interface pagesList {

    List<pageList> listpage(int pagenum);
    int pagenum();
}
