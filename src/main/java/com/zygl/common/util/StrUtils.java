package com.zygl.common.util;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * 字符串处理类
 *
 * @author user
 */
public class StrUtils {
    /**
     * 字符串加密
     */
    public static String Md5(String str) {
        if (str != null) {
            str = new Md5Hash(str).toString();
            return str;
        }
        return null;
    }
}
