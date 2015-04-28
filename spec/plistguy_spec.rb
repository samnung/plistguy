require 'spec_helper'

describe Plistguy do
  it 'has a version number' do
    expect(Plistguy::VERSION).not_to be nil
  end

  context 'file as input' do
    it 'correctly display value for valid existing key' do
      expect {

        res = system("./exe/plistguy -c 'Print :0:IOPlatformUUID' < spec/fixtures/ioreg.plist")
        expect(res).to eq true

      }.to output("FCBC0E58-0E35-5DC0-B0A6-75840BFB8F5B\n").to_stdout_from_any_process
    end

    it 'transfer stderr when not existing key' do
      expect {

        res = system("./exe/plistguy -c 'Print :0:A' < spec/fixtures/ioreg.plist")
        expect(res).to eq false

      }.to output(%Q{Print: Entry, ":0:A", Does Not Exist\n}).to_stderr_from_any_process
    end
  end

  it 'prints help' do
    expect {

      res = system('./exe/plistguy -h')
      expect(res).to eq true

    }.to output(/^plistguy/).to_stderr_from_any_process
  end

  context 'file as argument' do
    it 'correctly display value for valid existing key' do
      expect {

        res = system("./exe/plistguy -c 'Print :0:IOPlatformUUID' spec/fixtures/ioreg.plist")
        expect(res).to eq true

      }.to output("FCBC0E58-0E35-5DC0-B0A6-75840BFB8F5B\n").to_stdout_from_any_process
    end

    it 'transfer stderr when not existing key' do
      expect {

        res = system("./exe/plistguy -c 'Print :0:A' spec/fixtures/ioreg.plist")
        expect(res).to eq false

      }.to output(%Q{Print: Entry, ":0:A", Does Not Exist\n}).to_stderr_from_any_process
    end
  end
end
