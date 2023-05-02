# controls/pubsub_python.rb
project_id = attribute("project_id", {})
function_name = attribute("function_name", {})
service_account_email = attribute("service_account_email", {})

control "pubsub_python" do
  title "Check Pub/Sub-triggered Python Cloud Function"

  describe google_cloudfunctions_function(project: project_id, region: "us-central1", name: function_name) do
    it { should exist }
    its("name") { should eq function_name }
    its("runtime") { should eq "python310" }
    its("entry_point") { should eq "main.handler" }
    its("status") { should eq "ACTIVE"}
    its("https_trigger") { should be_nil }
    its("event_trigger.event_type") { should eq "google.pubsub.topic.publish" }
    its("service_account_email") { should eq service_account_email }
  end
end
