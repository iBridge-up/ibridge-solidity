pragma solidity 0.6.12;
pragma experimental ABIEncoderV2;


contract CentrifugeAsset {
  mapping (bytes32 => bool) public _assetsStored;

  event AssetStored(bytes32 indexed asset);

  /**
    @notice Marks {asset} as stored.
    @param asset Hash of asset deposited on Centrifuge chain.
    @notice {asset} must not have already been stored.
    @notice Emits {AssetStored} event.
   */
  function store(bytes32 asset) external {
      require(!_assetsStored[asset], "asset is already stored");

      _assetsStored[asset] = true;
      emit AssetStored(asset);
  }
}