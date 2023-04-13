title 'Google Cloud Storage'

gcp_project_id = attribute('gcp_project_id', description: 'The GCP project ID')
bucket_name = attribute('bucket_name', description: 'The GCS bucket name')

control 'storage-1' do
  impact 1.0
  title 'Check if the storage bucket exists and is accessible'

  describe google_storage_bucket(project: gcp_project_id, name: bucket_name) do
    it { should exist }
    its('storage_class') { should eq 'STANDARD' } # Change to the desired storage class
    its('location') { should eq 'US' } # Change to the desired location
  end
end
