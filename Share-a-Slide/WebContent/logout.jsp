		<%
        session=request.getSession();
        session.invalidate();
        session=request.getSession(false);
        response.sendRedirect("index.jsp");
     %>
		
