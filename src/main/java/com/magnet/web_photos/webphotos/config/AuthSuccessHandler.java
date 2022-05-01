package com.magnet.web_photos.webphotos.config;

import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.model.JwtRequest;
import com.magnet.web_photos.webphotos.model.JwtResponse;
import com.magnet.web_photos.webphotos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@Component
public class AuthSuccessHandler implements AuthenticationSuccessHandler {

    private final UserService userService;
	private AuthenticationManager authenticationManager;
	private JwtTokenUtil jwtTokenUtil;
	private UserDetailsService jwtInMemoryUserDetailsService;

	@Autowired
	public AuthSuccessHandler(UserService userService, AuthenticationManager authenticationManager, JwtTokenUtil jwtTokenUtil) {
		this.userService = userService;
		this.authenticationManager = authenticationManager;
		this.jwtTokenUtil = jwtTokenUtil;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException{

    	User user = userService.getUser(authentication.getName());
//		JwtRequest authenticationRequest = new JwtRequest(user.getUsername(), user.getPassword());
//		try {
//			authenticate(authenticationRequest.getUsername(), authenticationRequest.getPassword());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		final UserDetails userDetails = jwtInMemoryUserDetailsService
//				.loadUserByUsername(authenticationRequest.getUsername());
//
//		final String token = jwtTokenUtil.generateToken(userDetails);
//		response.addHeader("Authorization", "Bearer " + new JwtResponse(token));

//		return ResponseEntity.ok(new JwtResponse(token));

//		request.getSession().setAttribute("user", user);
//
//		response.sendRedirect(request.getContextPath() + "/home");
	}



	private void authenticate(String username, String password) throws Exception {
		Objects.requireNonNull(username);
		Objects.requireNonNull(password);
		try {
			authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
		} catch (DisabledException e) {
			throw new Exception("USER_DISABLED", e);
		} catch (BadCredentialsException e) {
			throw new Exception("INVALID_CREDENTIALS", e);
		}
	}

}
