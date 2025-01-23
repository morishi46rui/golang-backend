package main

import (
	"fmt"
	"log"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	swaggerFiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"

	_ "golang-backend/docs" // Swaggerの自動生成ファイルをインポート
	"golang-backend/routes"
)

// @title Go Backend API
// @version 1.0
// @description This is a sample server for Go Backend API.
// @host localhost:8080
// @BasePath /
func main() {
	r := gin.Default()

  // CORS ミドルウェアの詳細設定
	r.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"http://localhost:8081", "http://localhost:8080"}, // 許可するオリジン
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},       // 許可するHTTPメソッド
		AllowHeaders:     []string{"Origin", "Content-Type", "Accept"},              // 許可するヘッダー
		ExposeHeaders:    []string{"Content-Length"},                                // クライアントに公開するヘッダー
		AllowCredentials: true,                                                     // 認証情報を許可                                        // プリフライトリクエストのキャッシュ時間
	}))

	// Swagger UIのエンドポイント
	r.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))

	// healthエンドポイントを登録
	routes.RegisterHealthRoutes(r)

	fmt.Println("Server is running on http://localhost:8080")
	log.Fatal(r.Run(":8080"))
}
