<%@ WebHandler Language="C#" Class="delete" %>

using System;
using System.Web;
using System.Xml;

public class delete : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string b_SS = context.Request.Params["d1"].ToString();
        XmlDocument xd = new XmlDocument();
        xd.Load(context.Request.PhysicalApplicationPath + "xml/Words.xml");
        XmlNode N = xd.SelectSingleNode("/Dictionaries/Dictionarie[contains(number,'" + b_SS + "')]");
        if (N == null || b_SS == "")
        {
            context.Response.Write(0);
        }
        else
        {
            context.Response.Write(1);
            N.ParentNode.RemoveChild(N);
            try
            {
                xd.Save(context.Request.PhysicalApplicationPath + "xml/Words.xml");;
            }
            catch
            { context.Response.Write("删除数据失败！"); }
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}