resource "helm_release" "taxi_booking" {
  name      = "taxi-booking"
  namespace = "default"
  chart     = "${path.module}/web-app-chart"
  values = [
    file("${path.module}/web-app-chart/values.yaml")
  ]
}
