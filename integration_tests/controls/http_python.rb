# controls/http_python.rb
project_id = input("http_python_project_id")
function_name = input("http_python_function_name")
service_account_email = input("http_python_service_account_email")
region = input("http_python_region")
runtime = input("http_python_runtime")
entry_point = input("http_python_entry_point")

control "http_python" do
  title "Check HTTP-triggered Python Cloud Function"

  describe google_cloudfunctions_cloud_function(project: project_id, region: region, name: function_name) do
    it { should exist }
    its("name") { should(eq(function_name)) }
    its("runtime") { should(eq|(runtime))}
    its("entry_point") { should(eq(entry_point)) }
    its("status") { should(eq("ACTIVE"))}
    # its("https_trigger") { should_not be_nil }
    its("service_account_email") { should(eq(http_python_service_account_email)) }
  end
end


