package com.liu.servlet;

import com.liu.model.Article;
import com.liu.service.ArticleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "PostEditServlet")
public class PostEditServlet extends HttpServlet {
    ArticleService articleService;
    Article article;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        articleService = new ArticleService();
        String action = request.getParameter("action");
        int id=0;

        if (action.equals("delete")) {
            if (articleService.deleteArticle(Integer.parseInt(request.getParameter("id")))) {
                response.getWriter().write("删除成功");
            }
        }
        else {
            article = new Article();
            article.setTitle(request.getParameter("title"));
            article.setMd_content(request.getParameter("test-editormd-markdown-doc"));
            article.setHtml_content(request.getParameter("text"));
            int top = request.getParameter("top") == null ? 0 : 1;
            article.setTop(top);
            String year = request.getParameter("year");
            String month = request.getParameter("month");
            String day = request.getParameter("day");
            String hour = request.getParameter("hour");
            String minute = request.getParameter("minute");
            String createdate = year + "-" + month + "-" + day + " " + hour + ":" + minute;
            article.setCreatedate(createdate);
            article.setSubtitle(request.getParameter("subtitle"));
            article.setMain_id(Integer.parseInt(request.getParameter("main_id")));
            if(request.getParameter("sub_id")!=null)
                article.setSub_id(Integer.parseInt(request.getParameter("sub_id")));
            if(request.getParameter("id")!=null)
                id = Integer.parseInt(request.getParameter("id"));

            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=response.getWriter();
            if (action.equals("add")) {
                if (articleService.addArticle(article) == true) {
                    out.print("<script language='javascript'>alert('文章添加成功');window.location.href='PostlistServlet?role=1'</script>");
                } else {
                    out.print("<script language='javascript'>alert('文章添加失败');window.location.href='PostlistServlet?role=1'</script>");
                }
            } else if (action.equals("update")) {
                if (articleService.updateArticle(article, id) == true) {
                   out.print("<script language='javascript'>alert('文章更新成功');window.location.href='PostlistServlet?role=1'</script>");
                } else {
                    out.print("<script language='javascript'>alert('文章更新失败');window.location.href='PostlistServlet?role=1'</script>");
                }
            }
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}