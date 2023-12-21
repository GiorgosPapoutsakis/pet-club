<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_ergasia.*, java.util.List, java.util.ArrayList" %>

<%
WelfareUtilities welfUtil = new WelfareUtilities();
List<Welfare> welfares_to_return = new ArrayList<Welfare>();

// TablePaging
int PAGE_LIMIT = 5;
int query_offset = 0, welfares_count_before_paging = 0;
if (request.getParameter("new_offset") != null){
    query_offset = Integer.parseInt(request.getParameter("new_offset"));
}

//user used searchbar button
if (request.getParameter("searchBar") != null) { 

    String keyword = request.getParameter("searchBar");
    request.setAttribute("remember_keyword", keyword); //for TablePaging

    //Greek characters input
    if (keyword != null) { 
        keyword = new String(keyword.getBytes("ISO-8859-1"), "UTF-8");
    }

    welfares_count_before_paging = welfUtil.getCountWelfaresByKeyword(keyword);
    welfares_to_return = welfUtil.getPageWelfaresByKeyword(keyword, PAGE_LIMIT, query_offset);

    //if user is logged in, store the searches in volunteer_welfare table in DB
    if( session.getAttribute("volObj") != null){
        Volunteer vol = (Volunteer) session.getAttribute("volObj");
        int vol_primaryKey = vol.getPrimaryKey( vol.getUsername(), vol.getPassword() );
        welfUtil.saveLastSearch(vol_primaryKey, welfares_to_return, keyword);
    }

//first table to show before searchbar is used
} else { 

    //table if user is logged in
    if( session.getAttribute("volObj") != null){

        Volunteer vol = (Volunteer) session.getAttribute("volObj");
        if (vol.getLocation() != null){
            String location = vol.getLocation();
            welfares_count_before_paging = welfUtil.getCountWelfaresByLocation(location);
            welfares_to_return = welfUtil.getPageWelfaresByLocation(location, PAGE_LIMIT, query_offset);
        }

        if (welfares_to_return.size() == 0) {  //no location in user's profile or no welfares in that location
            welfares_count_before_paging = welfUtil.getCountAllWelfares();
            welfares_to_return = welfUtil.getPageAllWelfares(PAGE_LIMIT, query_offset);
        }

        
    //table if user isnt logged in
    }else{
        welfares_count_before_paging = welfUtil.getCountAllWelfares();
        welfares_to_return = welfUtil.getPageAllWelfares(PAGE_LIMIT, query_offset);
    }
}

//Paging Attributes
request.setAttribute("current_offset", query_offset);
request.setAttribute("total_welfares", welfares_count_before_paging);

//Welfares TablePage
request.setAttribute("welfare_table_list", welfares_to_return);

%>
<jsp:forward page="viewWelfares.jsp"/>


