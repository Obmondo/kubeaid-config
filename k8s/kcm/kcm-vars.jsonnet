{
  platform: 'kubeadm',
  extra_configs: true,
  'blackbox-exporter': false,
  connect_obmondo: false,
  connect_keda: false,
  grafana_keycloak_enable: false,
  grafana_root_url: '',
  kube_prometheus_version: 'v0.13.0',
  enable_custom_metrics_apiservice: true,
  prometheus_operator_resources+: {
    limits: { memory: '80Mi' },
    requests: { cpu: '10m', memory: '30Mi' },
  },
  alertmanager_resources+: {
    limits: { memory: '50Mi' },
    requests: { cpu: '10m', memory: '20Mi' },
  },
  prometheus_resources+: {
    limits: { memory: '1Gi' },
    requests: { cpu: '200m', memory: '500Mi' },
  },
  prometheus_scrape_namespaces: [
    'monitoring',
    'obmondo',
  ],
  prometheus+: {
    storage: {
      size: '10Gi',
    },
    retention: '15d',
  },
}
