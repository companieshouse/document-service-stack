resource "aws_route53_record" "document_api_alb_r53_record" {
  count   = var.document_api_create_alb && trimspace(var.zone_id) != "" && trimspace(var.internal_top_level_domain) != "" ? 1 : 0

  zone_id         = var.zone_id
  name            = "document-api${var.internal_top_level_domain}"
  type            = "A"
  allow_overwrite = true

  alias {
    name                   = module.document_api_alb[0].application_load_balancer_dns_name
    zone_id                = module.document_api_alb[0].application_load_balancer_zone_id
    evaluate_target_health = false
  }

  depends_on = [ module.document_api_alb ]
}


resource "aws_route53_record" "private_document_api_alb_r53_record" {
  count   = var.private_document_api_create_alb && trimspace(var.zone_id) != ""  && trimspace(var.internal_top_level_domain) != "" ? 1 : 0

  zone_id         = var.zone_id
  name            = "private-document-api${var.internal_top_level_domain}"

  type            = "A"
  allow_overwrite = true

  alias {
    name                   = module.private_document_api_alb[0].application_load_balancer_dns_name
    zone_id                = module.private_document_api_alb[0].application_load_balancer_zone_id
    evaluate_target_health = false
  }

  depends_on = [ module.private_document_api_alb ]
}