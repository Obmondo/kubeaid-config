{
  platform: 'kubeadm',
  extra_configs: true,
  'blackbox-exporter': true,
  connect_obmondo: true,
  connect_keda: true,
  grafana_keycloak_enable: false,
  grafana_root_url: 'https://grafana.kbm.obmondo.com',
  grafana_keycloak_url: 'https://keycloak.obmondo.com',
  grafana_keycloak_realm: 'Obmondo',
  kube_prometheus_version: 'v0.16.0',
  enable_custom_metrics_apiservice: true,
  addMixins: {
    velero: true,
    monitoring: true,
    smartmon: true,
    zfs: true,
    mdraid: true,
    ceph: true,
  },
  prometheus_operator_resources+: {
    limits: { memory: '120Mi' },
    requests: { cpu: '10m', memory: '30Mi' },
  },
  alertmanager_resources+: {
    limits: { memory: '200Mi' },
    requests: { cpu: '10m', memory: '20Mi' },
  },
  prometheus_resources+: {
    limits: { memory: '7Gi' },
    requests: { cpu: '200m', memory: '5Gi' },
  },
  prometheus_adapter_resources+: {
    limits: { memory: '3Gi' },
    requests: { cpu: '200m', memory: '2Gi' },
  },
  grafana_ingress_annotations: {
    'kubernetes.io/ingress.class': 'traefik-cert-manager',
  },
  prometheus_scrape_namespaces: [
  ],
  prometheus+: {
    storage: {
      size: '80Gi',
      classname: 'zfs-localpv',
    },
    retention: '15d',
  },
}
