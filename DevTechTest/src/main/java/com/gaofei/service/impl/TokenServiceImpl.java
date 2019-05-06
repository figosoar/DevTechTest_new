package com.gaofei.service.impl;

import org.springframework.stereotype.Service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.gaofei.entity.Admin;
import com.gaofei.service.ITokenService;

@Service("TokenService")
public class TokenServiceImpl implements ITokenService{
	public String getToken(Admin admin) {
        String token="";
        token= JWT.create().withAudience(admin.getAdminId())// 将 adminId保存到 token里面
                .sign(Algorithm.HMAC256(admin.getPwd()));// 以 密码作为 token的密钥
        return token;
    }
}
