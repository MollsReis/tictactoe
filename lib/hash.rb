class Hash
  def sample
    key = keys.sample
    {key => self[key]}
  end
end