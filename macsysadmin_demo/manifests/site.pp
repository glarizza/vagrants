node default {
  # Setup Wordpress
  include profiles::wordpress_localhost

  # Setup Jenkins
  #include profiles::jenkins
}
