# test/controls/httpevent_python.rb

project_id = attribute("project_id", {})
function_name = attribute("function_name", {})
service_account_email = attribute("service_account_email", {})
runtime = attribute("runtime", {})

control "cloud_functions" do
  title "Check Cloud Functions"

  describe google_cloudfunctions_function(project: project_id, region: "us-central1", name: function_name) do
    it { should exist }
    its("name") { should eq function_name }
    its("runtime") { should eq runtime }
    its("status") { should eq "ACTIVE" }
    its("service_account_email") { should eq service_account_email }
    
    # HTTP trigger
    context "when using an HTTP trigger" do
      it "should have an HTTPS trigger" do
        expect(subject.https_trigger).not_to be_nil
      end
      
      it "should not have an event trigger" do
        expect(subject.event_trigger).to be_nil
      end
    end
  end
end
