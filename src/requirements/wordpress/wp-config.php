<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wordpress' );

/** Database password */
define( 'DB_PASSWORD', '1234' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '&xiaepI:$nQVad8^^9Kk.Qlx}eM`re}Fy=AfhiPs#bYtI/yRua)yIt~/X;Lf7,&?' );
define( 'SECURE_AUTH_KEY',  'qKUn`{J Ha(n,R#d6Ovfe=QiIiJ5hh!|bJT`-wV(U>ggq6aQUYnz 9+P`E`Q7&LK' );
define( 'LOGGED_IN_KEY',    '6zbXQ@+h1)63MW2Ys-BF&t{ZOo|m1:*&x/bcc2#,xt_9.eQDCnJTh=oHibXwu cs' );
define( 'NONCE_KEY',        'UQ &XmQ4-7.<^M*/ZFGU@)`-YMpAKjxPtl,!K~$HxFT, w}fooVB`?+Zr_$RFT_i' );
define( 'AUTH_SALT',        'Uwi[bE+e2.>?im^01Uhra&(3I!xWjMY45vS/R:#-=,)QC*QjzsVxM!G`j}oHY.8u' );
define( 'SECURE_AUTH_SALT', 's;UVDpyCo^b,0_XC6cyAe`-p-y)t)Q,.|d$t=0eA&a5L%eN~ipQ.Cw=^fA>)%*gz' );
define( 'LOGGED_IN_SALT',   '$46(*H&SxEHbNG81]Dcf/,;[Pe$ZL*R:fSs#cS}_xe)yW+Fs+k.]/gj uKuc(Of%' );
define( 'NONCE_SALT',       '#EAtG!?_1wp&;3OPuT_-qx3R.&7.5L&cHW =YhI5[i@q+z~`<5Y:2F4e^r-4Z `>' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
