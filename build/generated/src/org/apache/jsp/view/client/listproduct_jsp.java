package org.apache.jsp.view.client;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class listproduct_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_url_var_value_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_url_var_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_var_items.release();
    _jspx_tagPool_c_url_var_value_nobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"> \n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n");
      out.write("        <title>Shop</title>\n");
      out.write("        <script src=\"https://use.fontawesome.com/0cc436713d.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("        ");
      if (_jspx_meth_c_url_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("        <link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${bootstrap}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" rel=\"stylesheet\" type=\"text/css\" media=\"all\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"popup_banner\">\n");
      out.write("            <div class=\"banner_popup_area\">\n");
      out.write("                ");
      if (_jspx_meth_c_url_1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                <img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${bootstrap}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" alt=\"\" width=\"100%\"/>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <nav>\n");
      out.write("            <div class=\"img-nav\">\n");
      out.write("                <a href=\"http://localhost:8084/Smartphone/DashboardServlet\">\n");
      out.write("                    ");
      if (_jspx_meth_c_url_2(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                    <img style=\"height: 40px; margin-left: 100px;\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${bootstrap}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                </a>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"content-nav\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"http://localhost:8084/Smartphone/DashboardServlet\">Home</a></li>\n");
      out.write("                    <li><a href=\"http://localhost:8084/Smartphone/ProductList\">Shop</a></li>\n");
      out.write("                    <li><a href=\"http://localhost:8084/Smartphone/DashboardServlet\">About us</a></li>\n");
      out.write("                    <li> <a href=\"http://localhost:8084/Smartphone/ListCartServlet\">\n");
      out.write("                            ");
      if (_jspx_meth_c_url_3(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                            <img  style=\"height: 20px;\"src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${bootstrap}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"/>\n");
      out.write("                        </a></li>\n");
      out.write("                </ul>\n");
      out.write("                <form action=\"ProductSearch\" method=\"post\">\n");
      out.write("                    <input type=\"text\" name=\"txtSearch\" placeholder=\"Search...\" />\n");
      out.write("                    <input type=\"submit\" value=\"Search\">\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"shop_option\">\n");
      out.write("                <a  class=\"link\" href=\"http://localhost:8084/Smartphone/LoginServlet\">\n");
      out.write("                    ");

                        String name = (String) session.getAttribute("name");
                        if (name == null) {
                            out.print("Login");
                        }
                    
      out.write("\n");
      out.write("                </a>\n");
      out.write("                <a class=\"link\" href=\"http://localhost:8084/Smartphone/SignUp\">\n");
      out.write("                    ");

                        if (name == null) {
                            out.print("Sign up");
                        }
                    
      out.write("\n");
      out.write("                </a>\n");
      out.write("                <a class=\"link\" href=\"\">\n");
      out.write("                    ");

                        if (name != null) {
                            out.print("Xin chào:" + name);
                        }
                    
      out.write("\n");
      out.write("                </a>\n");
      out.write("                <a class=\"link\" href=\"http://localhost:8084/Smartphone/LogoutServlet\">\n");
      out.write("                    ");

                        if (name != null) {
                            out.print("Log out");
                        }
                    
      out.write("\n");
      out.write("                </a>\n");
      out.write("            </div> \n");
      out.write("        </nav>\n");
      out.write("        <!-- content -->\n");
      out.write("        <div class=\"content\">\n");
      out.write("            <div class=\"san-pham\">\n");
      out.write("                <div class=\"loai-san-pham\">\n");
      out.write("                    <br>\n");
      out.write("                    <a href=\"http://localhost:8084/Smartphone/ProductList\">\n");
      out.write("                        <h2>LIST PRODUCT\n");
      out.write("                            <hr>\n");
      out.write("                        </h2>\n");
      out.write("                    </a>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"ds-dien-thoai\">\n");
      out.write("                    ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"footer\">\n");
      out.write("            <div class=\"footer-content\">\n");
      out.write("                <a href=\"http://localhost:8084/Smartphone/ListCartServlet\">\n");
      out.write("                    <p>Payment</p>\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"http://localhost:8084/Smartphone/ProductList\">\n");
      out.write("                    <p>Shipping</p>\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"http://localhost:8084/Smartphone/DashboardServlet\">\n");
      out.write("                    <p>About</p>\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"footer-content\">\n");
      out.write("                <h4>Stay Connected</h4>\n");
      out.write("                <a href=\"https://www.facebook.com/\"><p>Facebook<p></a>\n");
      out.write("                <a href=\"https://www.instagram.com/\"><p>Instagram<p></a>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"footer-content\">\n");
      out.write("                <h5>&copy;QDND</h5>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_url_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_url_0 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _jspx_tagPool_c_url_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_url_0.setPageContext(_jspx_page_context);
    _jspx_th_c_url_0.setParent(null);
    _jspx_th_c_url_0.setValue("/static/client/css/shop.css");
    _jspx_th_c_url_0.setVar("bootstrap");
    int _jspx_eval_c_url_0 = _jspx_th_c_url_0.doStartTag();
    if (_jspx_th_c_url_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_url_var_value_nobody.reuse(_jspx_th_c_url_0);
      return true;
    }
    _jspx_tagPool_c_url_var_value_nobody.reuse(_jspx_th_c_url_0);
    return false;
  }

  private boolean _jspx_meth_c_url_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_url_1 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _jspx_tagPool_c_url_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_url_1.setPageContext(_jspx_page_context);
    _jspx_th_c_url_1.setParent(null);
    _jspx_th_c_url_1.setValue("/static/client/images/banners/pop-banner.jpg");
    _jspx_th_c_url_1.setVar("bootstrap");
    int _jspx_eval_c_url_1 = _jspx_th_c_url_1.doStartTag();
    if (_jspx_th_c_url_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_url_var_value_nobody.reuse(_jspx_th_c_url_1);
      return true;
    }
    _jspx_tagPool_c_url_var_value_nobody.reuse(_jspx_th_c_url_1);
    return false;
  }

  private boolean _jspx_meth_c_url_2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_url_2 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _jspx_tagPool_c_url_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_url_2.setPageContext(_jspx_page_context);
    _jspx_th_c_url_2.setParent(null);
    _jspx_th_c_url_2.setValue("/static/client/images/logos/logo.png");
    _jspx_th_c_url_2.setVar("bootstrap");
    int _jspx_eval_c_url_2 = _jspx_th_c_url_2.doStartTag();
    if (_jspx_th_c_url_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_url_var_value_nobody.reuse(_jspx_th_c_url_2);
      return true;
    }
    _jspx_tagPool_c_url_var_value_nobody.reuse(_jspx_th_c_url_2);
    return false;
  }

  private boolean _jspx_meth_c_url_3(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_url_3 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _jspx_tagPool_c_url_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_url_3.setPageContext(_jspx_page_context);
    _jspx_th_c_url_3.setParent(null);
    _jspx_th_c_url_3.setValue("/static/client/images/shopping-cart.png");
    _jspx_th_c_url_3.setVar("bootstrap");
    int _jspx_eval_c_url_3 = _jspx_th_c_url_3.doStartTag();
    if (_jspx_th_c_url_3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_url_var_value_nobody.reuse(_jspx_th_c_url_3);
      return true;
    }
    _jspx_tagPool_c_url_var_value_nobody.reuse(_jspx_th_c_url_3);
    return false;
  }

  private boolean _jspx_meth_c_forEach_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_0.setParent(null);
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${listProduct}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_0.setVar("product");
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                        <div class=\"dien-thoai \">\n");
          out.write("                            <div class=\"sub-dien-thoai \">\n");
          out.write("                                <div class=\"img-dien-thoai \">\n");
          out.write("                                    <img  class=\"img-prd\"src=\"/Smartphone/static/admin/images/products/");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${product.image}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" alt=\"\">\n");
          out.write("                                </div>\n");
          out.write("                                <div class=\"ten-dien-thoai \">Thông");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${product.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</div>\n");
          out.write("                            </div>\n");
          out.write("                            <div class=\"gia \"><b>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${product.price}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</b></div>\n");
          out.write("                            <a href=\"http://localhost:8084/Smartphone/CartServlet?productId=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${product.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\"><button class=\"cart\" onclick=\"alert('Add Cart Success!!')\">Add Cart</button></a>\n");
          out.write("                        </div>\n");
          out.write("                    ");
          int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_0.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_0);
    }
    return false;
  }
}
