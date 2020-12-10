package com.kpi.lab4.servlets.actions;

import com.kpi.lab4.services.RequestService;
import com.kpi.lab4.utils.CreateRequestDtoBuilder;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;

public class RequestAction implements Action {
    private RequestService service;

    public RequestAction(RequestService service) {
        this.service = service;
    }

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response, ServletContext context)
            throws ServletException, IOException {
        String method = request.getMethod();
        if (method.equals("GET")) {
            request.getRequestDispatcher("/jsp/request.jsp").forward(request, response);
        } else if (method.equals("POST")) {
            CreateRequestDtoBuilder builder = new CreateRequestDtoBuilder();
            Iterator<String> it = request.getParameterNames().asIterator();
            while (it.hasNext()) {
                String name = it.next();
                String[] values = request.getParameterValues(name);
                builder.set(name, values[0]);
            }
            try {
                service.createRequest(builder.build());
                context.setAttribute(
                        "message",
                        "All success. Our manager will choose the most suitable room for you."
                );
            } catch (SQLException | IllegalArgumentException ignored) {
                context.setAttribute("error", "Sorry, now we are temporary unavailable.");
            }
            request.getRequestDispatcher("/jsp/request.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/jsp/error.jsp").forward(request, response);
        }
    }
}