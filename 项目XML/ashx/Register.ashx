<%@ WebHandler Language="C#" Class="Register" %>

using System;
using System.Web;
    using System.Xml;

public class Register : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string b_ID = context.Request.Params["d1"].ToString();
        string b_Name = context.Request.Params["d2"].ToString();
        string b_Type = context.Request.Params["d3"].ToString();

        XmlDocument xd = new XmlDocument();
        xd.Load(context.Request.PhysicalApplicationPath + "xml/Login.xml");

        XmlNode N = xd.SelectSingleNode("/all/Login[id='" + b_ID + "']");
        if (N == null)
        {
            XmlElement o_ID = xd.CreateElement("id");
            o_ID.InnerText = b_ID;
            
            XmlElement o_Name = xd.CreateElement("name");
            o_Name.InnerText = b_Name;

            XmlElement o_Type = xd.CreateElement("type");
            o_Type.InnerText = b_Type;
                 
            
            XmlElement o_login = xd.CreateElement("Login");
            o_login.AppendChild(o_ID);
            o_login.AppendChild(o_Name);
            o_login.AppendChild(o_Type);
            
            XmlNode root = xd.SelectSingleNode("/all");
            root.AppendChild(o_login);
            try
            {
                xd.Save(context.Request.PhysicalApplicationPath + "xml/Login.xml");
                context.Response.Write("注册成功");
            }
            catch
            { context.Response.Write("注册失败！"); }
            
        }else if(b_ID == ""){
            context.Response.Write("请输入账号或密码！");
        }
        else
        {
            context.Response.Write("账号已存在！");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}