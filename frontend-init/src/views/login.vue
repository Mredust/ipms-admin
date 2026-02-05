<template>
  <div class="login" :style="backgroundStyle">
    <div class="login-overlay"></div>
    <div class="login-content">
      <div class="login-brand">
        <h1 v-if="displayTitle" class="brand-title">{{ displayTitle }}</h1>
        <p v-if="displaySubtitle" class="brand-subtitle">{{ displaySubtitle }}</p>
      </div>

      <el-form ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form">
        <div class="form-title">管理员登录</div>
        <el-form-item prop="username">
          <el-input
            v-model="loginForm.username"
            type="text"
            auto-complete="off"
            placeholder="请输入用户名"
          >
            <svg-icon slot="prefix" icon-class="user" class="el-input__icon input-icon"/>
          </el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input
            v-model="loginForm.password"
            type="password"
            auto-complete="off"
            placeholder="请输入密码"
            @keyup.enter.native="handleLogin"
          >
            <svg-icon slot="prefix" icon-class="password" class="el-input__icon input-icon"/>
          </el-input>
        </el-form-item>
        <el-form-item prop="code" v-if="captchaEnabled">
          <el-input
            v-model="loginForm.code"
            auto-complete="off"
            placeholder="请输入验证码"
            class="captcha-input"
            @keyup.enter.native="handleLogin"
          >
            <svg-icon slot="prefix" icon-class="validCode" class="el-input__icon input-icon"/>
          </el-input>
          <div class="login-code">
            <img :src="codeUrl" @click="getCode" class="login-code-img"/>
          </div>
        </el-form-item>
        <el-form-item class="login-actions">
          <el-button
            :loading="loading"
            size="medium"
            type="primary"
            class="login-button"
            @click.native.prevent="handleLogin"
          >
            <span v-if="!loading">登录</span>
            <span v-else>登录中</span>
          </el-button>
          <div class="register-entry" v-if="register">
            <router-link class="link-type" :to="'/register'">立即注册</router-link>
          </div>
        </el-form-item>
        <el-form-item class="meeting-server">
          <el-button>
            会议服务
          </el-button>
        </el-form-item>
      </el-form>
    </div>

    <div v-if="displayFooter" class="el-login-footer">
      <span>{{ displayFooter }}</span>
    </div>
  </div>
</template>

<script>
import {getCodeImg} from "@/api/login"
import {listPage} from "@/api/ipms/page"
import Cookies from "js-cookie"
import {decrypt, encrypt} from "@/utils/jsencrypt"
import {isExternal} from "@/utils/validate"

export default {
  name: "Login",
  data() {
    return {
      defaultTitle: process.env.VUE_APP_TITLE,
      codeUrl: "",
      pageLoaded: false,
      pageList: [],
      loginForm: {
        username: "admin",
        password: "admin123",
        rememberMe: false,
        code: "",
        uuid: ""
      },
      loginRules: {
        username: [
          {required: true, trigger: "blur", message: "用户名不能为空"}
        ],
        password: [
          {required: true, trigger: "blur", message: "密码不能为空"}
        ],
        code: [{required: true, trigger: "change", message: "验证码不能为空"}]
      },
      loading: false,
      // 验证码开关
      captchaEnabled: true,
      // 注册开关
      register: false,
      redirect: undefined
    }
  },
  computed: {
    activePage() {
      if (!this.pageLoaded || !this.pageList.length) {
        return null
      }
      const pageId = this.$route && this.$route.query && this.$route.query.pageId
      if (pageId) {
        const match = this.pageList.find(item => String(item.id) === String(pageId))
        return match || this.pageList[0]
      }
      return this.pageList[0]
    },
    displayTitle() {
      if (!this.pageLoaded) {
        return this.defaultTitle
      }
      return this.activePage && this.activePage.title ? this.activePage.title : ""
    },
    displaySubtitle() {
      return this.activePage && this.activePage.subtitle ? this.activePage.subtitle : ""
    },
    displayFooter() {
      return this.activePage && this.activePage.footer ? this.activePage.footer : ""
    },
    backgroundStyle() {
      const img = this.activePage ? this.activePage.backgroundImage : ""
      if (!img) {
        return {}
      }
      const real = isExternal(img) ? img : process.env.VUE_APP_BASE_API + img
      return {
        backgroundImage: `url(${real})`
      }
    }
  },
  watch: {
    $route: {
      handler: function (route) {
        this.redirect = route.query && route.query.redirect
      },
      immediate: true
    }
  },
  created() {
    this.getCode()
    this.getCookie()
    this.getPageConfig()
  },
  methods: {
    getPageConfig() {
      listPage({pageNum: 1, pageSize: 10}).then(res => {
        const rows = res && res.rows ? res.rows : []
        this.pageList = rows
        this.pageLoaded = true
      }).catch(() => {
      })
    },
    getCode() {
      getCodeImg().then(res => {
        this.captchaEnabled = res.captchaEnabled === undefined ? true : res.captchaEnabled
        if (this.captchaEnabled) {
          this.codeUrl = "data:image/gif;base64," + res.img
          this.loginForm.uuid = res.uuid
        }
      })
    },
    getCookie() {
      const username = Cookies.get("username")
      const password = Cookies.get("password")
      const rememberMe = Cookies.get('rememberMe')
      this.loginForm = {
        username: username === undefined ? this.loginForm.username : username,
        password: password === undefined ? this.loginForm.password : decrypt(password),
        rememberMe: rememberMe === undefined ? false : Boolean(rememberMe)
      }
    },
    handleLogin() {
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.loading = true
          if (this.loginForm.rememberMe) {
            Cookies.set("username", this.loginForm.username, {expires: 30})
            Cookies.set("password", encrypt(this.loginForm.password), {expires: 30})
            Cookies.set('rememberMe', this.loginForm.rememberMe, {expires: 30})
          } else {
            Cookies.remove("username")
            Cookies.remove("password")
            Cookies.remove('rememberMe')
          }
          this.$store.dispatch("Login", this.loginForm).then(() => {
            this.$router.push({path: this.redirect || "/"}).catch(() => {
            })
          }).catch(() => {
            this.loading = false
            if (this.captchaEnabled) {
              this.getCode()
            }
          })
        }
      })
    }
  }
}
</script>

<style rel="stylesheet/scss" lang="scss">
.login {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  background-image: url("../assets/images/login-background.jpg");
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}

.login-overlay {
  position: absolute;
  inset: 0;
}

.login-content {
  position: relative;
  z-index: 1;
  width: min(1200px, 92%);
  display: flex;
  align-items: flex-start;
  justify-content: center;
  gap: 48px;
}

.login-brand {
  flex: 0 1 520px;
  color: #fff;
  text-align: right;
}

.brand-title {
  font-size: 68px;
  font-weight: 700;
  letter-spacing: 5px;
  margin: 0 0 12px 0;
  text-shadow: 0 6px 20px rgba(0, 0, 0, 0.25);
}

.brand-subtitle {
  font-size: 25px;
  font-weight: 600;
  letter-spacing: 4px;
  margin: 0;
  color: rgba(255, 255, 255, 0.9);
  text-shadow: 0 4px 16px rgba(0, 0, 0, 0.25);
}

.login-form {
  width: 360px;
  padding: 28px 35px 22px;
  background: rgba(0, 0, 0, 0.30);
  box-shadow: 0 16px 40px rgba(0, 0, 0, 0.25);
  z-index: 1;

  .form-title {
    text-align: center;
    font-size: 28px;
    color: #fff;
    margin: 15px 0 30px 0;
  }

  .el-input {
    height: 40px;

    input {
      height: 40px;
      background: #ffffff;
      border: none;
    }
  }

  .input-icon {
    height: 40px;
    width: 16px;
    margin-left: 2px;
  }
}

.captcha-input {
  width: 63%;
}

.login-code {
  width: 33%;
  height: 40px;
  float: right;

  img {
    cursor: pointer;
    vertical-align: middle;
  }
}

.login-code-img {
  height: 40px;
}

.remember-me {
  margin: 6px 0 18px;
  color: #fff;
}

.login-actions {
  width: 100%;
  margin-bottom: 18px;
  background: #9bbc00;
  border-color: #9bbc00;

}

.login-button {
  width: 100%;
  background: #9bbc00;
  border-color: #9bbc00;
  color: #fff;
  font-size: 15px;
  letter-spacing: 5px;
}

.meeting-server {
  .el-button {
    width: 35%;
    background: #9bbc00;
    border-color: #9bbc00;
    color: #fff;
  }
}

.register-entry {
  text-align: right;
  margin-top: 12px;

  .link-type {
    color: #ffffff;
  }
}

.el-login-footer {
  position: fixed;
  bottom: 0;
  width: 100%;
  text-align: center;
  color: #ffffff;
  font-size: 12px;
  letter-spacing: 1px;
  padding: 10px 0 24px;
}

@media (max-width: 960px) {
  .login-content {
    flex-direction: column;
    align-items: stretch;
    gap: 24px;
  }

  .login-brand {
    text-align: right;
  }

  .login-form {
    width: 100%;
  }
}
</style>
