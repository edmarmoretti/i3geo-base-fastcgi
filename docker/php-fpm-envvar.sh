#!/bin/bash    
echo "" >> /etc/php/5.6/fpm/pool.d/www.conf # new line.
if ! [ -z "$DB_HOST" ]
then
    echo "env[DB_HOST] = $DB_HOST;" >>  /etc/php/5.6/fpm/pool.d/www.conf
fi
echo "" >> /etc/php/5.6/fpm/pool.d/www.conf # new line.
if ! [ -z "$DB_PORT" ]
then
    echo "env[DB_PORT] = $DB_PORT;" >>  /etc/php/5.6/fpm/pool.d/www.conf
fi
echo "" >> /etc/php/5.6/fpm/pool.d/www.conf # new line.
if ! [ -z "$DB_DATABASE" ]
then
    echo "env[DB_DATABASE] = $DB_DATABASE;" >>  /etc/php/5.6/fpm/pool.d/www.conf
fi
echo "" >> /etc/php/5.6/fpm/pool.d/www.conf # new line.
if ! [ -z "$DB_USER" ]
then
    echo "env[DB_USER] = $DB_USER;" >>  /etc/php/5.6/fpm/pool.d/www.conf
fi
echo "" >> /etc/php/5.6/fpm/pool.d/www.conf # new line.
if ! [ -z "$DB_PASSWORD" ]
then
    echo "env[DB_PASSWORD] = $DB_PASSWORD;" >>  /etc/php/5.6/fpm/pool.d/www.conf
fi
echo "" >> /etc/php/5.6/fpm/pool.d/www.conf # new line.
echo $'php_admin_flag[default_charset] = ""' >>  /etc/php/5.6/fpm/pool.d/www.conf
echo "" >> /etc/php/5.6/fpm/pool.d/www.conf # new line.
echo ";php_admin_flag[session.save_path] = 'tcp://127.0.0.1:11211'" >>  /etc/php/5.6/fpm/pool.d/www.conf
echo "" >> /etc/php/5.6/fpm/pool.d/www.conf # new line.
echo ";php_admin_flag[session.save_handler] = memcache" >>  /etc/php/5.6/fpm/pool.d/www.conf

echo "" >> /etc/php/5.6/fpm/pool.d/www.conf # new line.
echo "pm =  dynamic" >>  /etc/php/5.6/fpm/pool.d/www.conf
echo "" >> /etc/php/5.6/fpm/pool.d/www.conf # new line.
echo "pm.max_children = 120" >>  /etc/php/5.6/fpm/pool.d/www.conf
echo "" >> /etc/php/5.6/fpm/pool.d/www.conf # new line.
echo "pm.start_servers = 36" >>  /etc/php/5.6/fpm/pool.d/www.conf
echo "" >> /etc/php/5.6/fpm/pool.d/www.conf # new line.
echo "pm.min_spare_servers = 15" >>  /etc/php/5.6/fpm/pool.d/www.conf
echo "" >> /etc/php/5.6/fpm/pool.d/www.conf # new line.
echo "pm.max_spare_servers = 50" >>  /etc/php/5.6/fpm/pool.d/www.conf
echo "" >> /etc/php/5.6/fpm/pool.d/www.conf # new line.
echo "pm.max_requests = 200" >>  /etc/php/5.6/fpm/pool.d/www.conf
echo "" >> /etc/php/5.6/fpm/pool.d/www.conf # new line.
echo "pm.process_idle_timeout = 5s" >>  /etc/php/5.6/fpm/pool.d/www.conf





