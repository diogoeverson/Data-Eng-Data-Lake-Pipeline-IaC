#glue catalog-database

resource "aws_glue_catalog_database" "database" {
  name = "database-${var.product}"
}

#parquet table for athena

resource "aws_glue_catalog_table" "table" {
  name          = "table-${var.product}"
  database_name = aws_glue_catalog_database.database.name

  table_type = "EXTERNAL_TABLE"

  parameters = {
    EXTERNAL              = "TRUE"
    "parquet.compression" = "SNAPPY"
  }

  storage_descriptor {
    location      = "s3://my-bucket/event-streams/my-stream"
    input_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"

    ser_de_info {
      name                  = "my-stream"
      serialization_library = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"

      parameters = {
        "serialization.format" = 1
      }
    }

    columns {
      name = "symboling"
      type = "string"
    }

    columns {
      name = "normalized-losses"
      type = "string"
    }

    columns {
      name = "make"
      type = "string"
    }

    columns {
      name = "fuel-type"
      type = "string"
    }

    columns {
      name = "aspiration"
      type = "string"
    }

    columns {
      name = "num-of-doors"
      type = "string"
    }

    columns {
      name = "body-style"
      type = "string"
    }

    columns {
      name = "drive-wheels"
      type = "string"
    }

    columns {
      name = "engine-location"
      type = "string"
    }

    columns {
      name = "wheel-base "
      type = "string"
    }

    columns {
      name = "length"
      type = "string"
    }

    columns {
      name = "width"
      type = "string"
    }

    columns {
      name = "height"
      type = "string"
    }

    columns {
      name = "curb-weight"
      type = "string"
    }

    columns {
      name = "engine-type"
      type = "string"
    }

    columns {
      name = "num-of-cylinders"
      type = "string"
    }

    columns {
      name = "engine-size"
      type = "string"
    }

    columns {
      name = "fuel-system"
      type = "string"
    }

    columns {
      name = "bore"
      type = "string"
    }

    columns {
      name = "stroke"
      type = "string"
    }

    columns {
      name = "compression-ratio"
      type = "string"
    }

    columns {
      name = "horsepower"
      type = "string"
    }

    columns {
      name = "peak-rpm"
      type = "string"
    }

    columns {
      name = "highway-mpg"
      type = "string"
    }

    columns {
      name = "price"
      type = "string"
    }
  }
}