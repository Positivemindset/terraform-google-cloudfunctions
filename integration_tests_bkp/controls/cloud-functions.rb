title 'Google Cloud Function'

gcp_project_id = attribute('gcp_project_id', description: 'The GCP project ID')
function_name = attribute('function_name', description: 'The name of the cloud function')

control 'cloud-function-1' do
  impact 1.0
  title 'Check if the cloud function exists'

  describe google_cloudfunctions_cloud_function(project: gcp_project_id, region: 'us-central1', name: function_name) do
    it { should exist }
    its('runtime') { should eq 'python' } # Change to the desired runtime value
    its('entry_point') { should eq 'my_function' } # Change to the desired entry point
  end
end
