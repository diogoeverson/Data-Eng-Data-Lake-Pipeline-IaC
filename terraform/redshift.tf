resource "aws_redshift_cluster" "aws_redshift_cluster_poc" {
  cluster_identifier  = "redshift-cluster-poc"
  database_name       = "redshift_cluster_db_poc"
  master_username     = "redshift_cluster_poc_master_user"
  master_password     = "Passw0rd_rcpmu"
  node_type           = "dc2.large"
  cluster_type        = "single-node"
  skip_final_snapshot = "true"
}