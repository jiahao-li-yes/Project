
 <%@ WebHandler Language="C#" Class="update" %>

using System;
using System.Web;
using  System.Xml;

public class update : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
       context.Response.ContentType = "text/plain";
        string b_old_text1 = context.Request.Params["d1"].ToString();
        string b_new_text2 = context.Request.Params["d2"].ToString();
        string b_new_text3 = context.Request.Params["d3"].ToString();
        string b_new_text4 = context.Request.Params["d4"].ToString();
        XmlDocument xd = new XmlDocument();
        xd.Load(context.Request.PhysicalApplicationPath + "xml/Words.xml");
        XmlNode N = xd.SelectSingleNode("/Dictionaries/Dictionarie[contains(number,'" + b_old_text1 + "')]");
        if (b_old_text1 == "")
        {
            context.Response.Write("搜索框内容不能为空");
        }
        else if(N == null)
        {
             context.Response.Write("输入有误"); 
        }
        else
            {
                N.ChildNodes[1].InnerText = b_new_text2;
                N.ChildNodes[2].InnerText = b_new_text3;
                N.ChildNodes[3].InnerText = b_new_text4;
                xd.Save(context.Request.PhysicalApplicationPath + "xml/Words.xml");
                context.Response.Write("更新成功");
            }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}