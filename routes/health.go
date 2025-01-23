package routes

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// RegisterHealthRoutes はhealthエンドポイントを登録します。
// @Summary ヘルスチェック
// @Description サーバーの状態を確認します。
// @Tags Health
// @Produce json
// @Success 200 {object} map[string]string
// @Router /health [get]
func RegisterHealthRoutes(r *gin.Engine) {
	r.GET("/health", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"status": "healthy"})
	})
}
