<%@ WebHandler Language="C#" Class="Login" %>

using System;
using System.Web;
using System.Xml;

public class Login : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string o_id = context.Request.Params["d1"].ToString();
        string o_name = context.Request.Params["d2"].ToString();
        string o_type = context.Request.Params["d3"].ToString();

        XmlDocument xd = new XmlDocument();
        xd.Load(context.Request.PhysicalApplicationPath + "xml/Login.xml");
        XmlNodeList N = xd.SelectNodes("/all/Login");

        foreach (XmlNode n in N)
        {
            if (n.FirstChild.InnerText == o_id && n.FirstChild.NextSibling.InnerText == o_name && n.LastChild.InnerText == o_type)
            {
                context.Response.Write("1");
            }
        }  
        
        if (o_id == "" || o_name == "")
        {
            context.Response.Write("0");
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}