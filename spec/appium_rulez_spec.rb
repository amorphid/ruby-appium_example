describe "Home page" do
  let(:caps) do
    {
      app: "./spec/support/app-debug.apk",
      deviceName: "",
      platformName: "Android"
    }
  end

  let(:driver) { Appium::Driver.new(caps: caps) }

  before do
    driver.start_driver
    Appium.promote_appium_methods RSpec::Core::ExampleGroup
  end

  it "contains a message" do
    find("Appium Rulez!")
  end
end
