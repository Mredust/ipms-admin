<template>
  <div class="slogan-preview" :style="backgroundStyle">
    <div class="slogan-content">
      <div class="slogan-main" :style="mainStyle">
        {{ slogan.welcomeText }}
      </div>
      <div class="slogan-sub" :style="subStyle">
        {{ slogan.usingText }}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "MeetingSloganPreview",
  data() {
    return {
      slogan: {
        welcomeText: "欢迎您莅临此次会议",
        usingText: "使用中",
        mainFont: "方正小标宋简体",
        mainColor: "#ffffff",
        mainSize: "8em",
        otherFont: "方正小标宋简体",
        otherColor: "#ffffff",
        otherSize: "2em",
        background: ""
      }
    }
  },
  computed: {
    backgroundStyle() {
      const url = this.resolveImageUrl(this.slogan.background)
      return {
        backgroundImage: url ? `url(${url})` : "none"
      }
    },
    mainStyle() {
      return {
        fontFamily: this.slogan.mainFont,
        color: this.slogan.mainColor,
        fontSize: this.slogan.mainSize
      }
    },
    subStyle() {
      return {
        fontFamily: this.slogan.otherFont,
        color: this.slogan.otherColor,
        fontSize: this.slogan.otherSize
      }
    }
  },
  created() {
    const raw = localStorage.getItem("ipms_meeting_slogan_preview")
    if (raw) {
      try {
        const data = JSON.parse(raw)
        this.slogan = { ...this.slogan, ...data }
      } catch (e) {
        // ignore parse error
      }
    }
  },
  methods: {
    resolveImageUrl(path) {
      if (!path) return ""
      if (path.startsWith("http")) return path
      if (path.startsWith("/meeting-bg/")) return path
      return process.env.VUE_APP_BASE_API + path
    }
  }
}
</script>

<style scoped>
.slogan-preview {
  width: 100%;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}

.slogan-content {
  text-align: center;
  padding: 24px;
}

.slogan-main {
  font-weight: 600;
  line-height: 1.2;
}

.slogan-sub {
  margin-top: 16px;
  line-height: 1.2;
}
</style>
