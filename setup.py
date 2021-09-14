from setuptools import setup, find_packages

setup(
    name="files-local-kubernetes",
    version="0.1",
    description="Terraform files to deploy Meltano locally",
    packages=find_packages(),
    package_data={
        "bundle": [
            'infrastructure/local/outputs.tf',
            'infrastructure/local/main.tf',
            'infrastructure/local/Dockerfile',
            'infrastructure/local/kind_cluster.tf',
            'infrastructure/local/postgres.tf',
            'infrastructure/local/dev_images.tf',
            'infrastructure/local/providers.tf',
            'infrastructure/local/README.md',
            'infrastructure/local/variables.tf',
            'infrastructure/local/files',
            'infrastructure/local/airflow.tf',
            'infrastructure/local/files/nginx_ingress_controller_manifest.yaml',
            'infrastructure/local/files/pod-template-file.yml',
            'infrastructure/local/files/webserver_config.py',
            'infrastructure/local/files/nfs-server-provider-values.yml'
        ]
    },
)
