import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

public class OutputUtil {

	public static String redirect(String message) {
		
		StringBuilder sb = new StringBuilder();
		


		sb.append("<html>");
		sb.append("<head>");
		sb.append("<meta charset='UTF-8'>");
		sb.append("</head>");
		sb.append("<body>");
		sb.append("<script>");
		sb.append("alert('실패');");
		sb.append("history.back();");
		sb.append("</script>");
		sb.append("</body>");
		sb.append("</html>");
		
		return sb.toString();
	}
}
