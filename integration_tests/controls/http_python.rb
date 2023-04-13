# copyright: 2018, The Authors

title "Sample Section"

http_python_project_id = input("http_python_project_id")
http_python_region     = input("http_python_region")
http_python_function_name = input("http_python_function_name")
http_python_description     = input("http_python_description")
http_python_url             = "https://"+http_python_region+"-"+http_python_project_id+".cloudfunctions.net/"+http_python_function_name

control "hub-vpn-tunnel2" do
  impact 1.0
  describe google_cloudfunctions_cloud_function(project: http_python_project_id, location: http_python_region, name: http_python_function_name) do
    it { should exist }
    its('description') { should(eq(http_python_description)) }
    its('available_memory_mb') { should eq 256 }
    its('https_trigger.url') { should match(http_python_url) }
    its('entry_point') { should eq 'hello_world' }
    its('environment_variables') { should include('VAR1' => 'value1') }
  end
end