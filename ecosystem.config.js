module.exports = {
  apps: [
    {
      name: "API",
      script: "index.js",
      cwd: "",
      watch: ["api", "app", "database"],
      ignore_watch: [".git", "node_modules", "docs", "dist", "public"],
      out_file: "public/logs/debug/node-debug.log",
      error_file: "public/logs/debug/node-error.log",
      log_date_format: "YYYY-MM-DD HH:mm:ss",
      env_production: {
        PORT: "9000",
        ENV_TYPE: "production",
        DATABASE_CLIENT: "mysql",
        DATABASE_HOST: "localhost",
        DATABASE_USER_NAME: "root",
        DATABASE_PASSWORD: "",
        DATABASE_NAME: "node-base-api-2022",
        DB_DEBUG: 0,
        JWT_SECRET: "nodebase2022",
        JWT_EXPIRE_TIME: 18000,
        API_URL: "https://localhost:9000/",
        SITE_URL: "https://localhost:4200/",
        ADMIN_URL: "https://localhost:3000/",
      },
    },
  ],
};
