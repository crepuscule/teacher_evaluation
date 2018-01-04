package cn.edu.just.zjg.te.util;

import redis.clients.jedis.Jedis;

public class RedisUtil {

    public static Jedis getJedis() {
        return new Jedis("127.0.0.1", 6379);
    }

}
