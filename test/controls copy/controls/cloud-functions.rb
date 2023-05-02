# test/controls/cloud_functions.rb

project_id = attribute("project_id", {})
function_name = attribute("function_name", {})
service_account_email = attribute("service_account_email", {})

control "cloud_functions" do
  title "Check Cloud Functions"

  describe google_cloudfunctions_function(project: project_id, region: "us-central1", name: function_name) do
    it { should exist }
    its("name") { should eq function_name }
    its("runtime") { should eq var.runtime }
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
    
    # Pub/Sub trigger
    context "when using a Pub/Sub trigger" do
      let(:pubsub_topic_name) { attribute("pubsub_topic_name", {}) }
      
      it "should not have an HTTPS trigger" do
        expect(subject.https_trigger).to be_nil
      end
      
      it "should have an event trigger with the correct topic name" do
        expect(subject.event_trigger.event_type).to eq "google.pubsub.topic.publish"
        expect(subject.event_trigger.resource).to eq "//pubsub.googleapis.com/projects/#{project_id}/topics/#{pubsub_topic_name}"
      end
    end
    
    # Cloud Storage trigger
    context "when using a Cloud Storage trigger" do
      let(:trigger_event_type_bucket) { attribute("trigger_event_type_bucket", {}) }
      let(:trigger_event_resource) { attribute("trigger_event_resource", {}) }
      
      it "should not have an HTTPS trigger" do
        expect(subject.https_trigger).to be_nil
      end
      
      it "should have an event trigger with the correct bucket and event type" do
        expect(subject.event_trigger.event_type).to eq trigger_event_type_bucket
        expect(subject.event_trigger.resource).to eq "//storage.googleapis.com/projects/_/buckets/#{trigger_event_resource}"
      end
    end
  end
end
