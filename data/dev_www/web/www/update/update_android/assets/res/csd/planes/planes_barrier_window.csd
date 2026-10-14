<GameFile>
  <PropertyGroup Name="planes_barrier_window" Type="Layer" ID="sgzmqal2fvx7k9p5ojyub40crd1h3-newi8t" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="15" Speed="1.000000">
        <Timeline ActionTag="997540483" Property="Scale">
          <ScaleFrame FrameIndex="0" X="0.300000" Y="0.300000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="12" X="1.100000" Y="1.100000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="15" X="1.000000" Y="1.000000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="997540483" Property="Alpha">
          <IntFrame FrameIndex="0" Value="25">
            <EasingData Type="0" />
          </IntFrame>
          <IntFrame FrameIndex="12" Value="204">
            <EasingData Type="0" />
          </IntFrame>
          <IntFrame FrameIndex="15" Value="255">
            <EasingData Type="0" />
          </IntFrame>
        </Timeline>
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="-213201536" Tag="117" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" ComboBoxIndex="1" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="1" ScaleY="0" />
            <SingleColor A="255" B="0" G="0" R="0" />
          </AbstractNodeData>
          <AbstractNodeData Name="main_container" ActionTag="997540483" Tag="118" RotationSkewX="0" RotationSkewY="0" LeftMargin="23" RightMargin="23" TopMargin="407" BottomMargin="407" TouchEnable="True" BackColorAlpha="102" Scale9Enable="True" LeftEage="-10" RightEage="-10" TopEage="-10" BottomEage="-10" Scale9OriginX="-10" Scale9OriginY="-10" Scale9Width="20" Scale9Height="20" ctype="PanelObjectData">
            <Size Y="466" X="674" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="1" ScaleY="0" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="image_bg" ActionTag="1872464410" Tag="119" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="25" RightEage="25" TopEage="24" BottomEage="24" Scale9OriginX="25" Scale9OriginY="24" Scale9Width="44" Scale9Height="48" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="466" X="674" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="337" Y="233" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1039.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="image_title" ActionTag="1651809473" Tag="120" RotationSkewX="0" RotationSkewY="0" LeftMargin="178" RightMargin="178" TopMargin="-18.5" BottomMargin="425.5" LeftEage="45" RightEage="45" TopEage="0" BottomEage="0" Scale9OriginX="45" Scale9OriginY="0" Scale9Width="1" Scale9Height="59" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="59" X="318" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="337" Y="455" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1024.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="btn_sure" ActionTag="-1392333775" Tag="122" RotationSkewX="0" RotationSkewY="0" LeftMargin="257.5" RightMargin="257.5" TopMargin="371.5" BottomMargin="33.5" TouchEnable="True" LeftEage="5" RightEage="5" TopEage="20" BottomEage="20" Scale9OriginX="5" Scale9OriginY="20" Scale9Width="8" Scale9Height="21" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="61" X="159" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="337" Y="64" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1018.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="1929670065" Tag="123" RotationSkewX="0" RotationSkewY="0" LeftMargin="26" RightMargin="26" TopMargin="16.5" BottomMargin="16.5" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="32" X="109" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="79.5" Y="30.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="21" G="74" R="41" />
                    <ShadowColor A="255" B="0" G="0" R="0" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="close_btn" ActionTag="64620296" Tag="124" RotationSkewX="0" RotationSkewY="0" LeftMargin="628.638977" RightMargin="-13.639" TopMargin="-16.603001" BottomMargin="411.602997" TouchEnable="True" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="29" Scale9Height="49" ShadowOffsetX="0" ShadowOffsetY="0" ButtonText="" FontSize="14" ctype="ButtonObjectData">
                <Size Y="62" X="70" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="658.138977" Y="447.102997" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <NormalFileData Type="PlistSubImage" Path="common_1028.png" Plist="resource/common/common.plist" />
                <PressedFileData Type="Default" Path="Default/Button_Press.png" Plist="" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                <TextColor A="255" B="70" G="65" R="65" />
                <OutlineColor A="255" B="198" G="63" R="0" />
                <FontResource />
                <ShadowColor A="255" B="0" G="0" R="0" />
              </AbstractNodeData>
              <AbstractNodeData Name="win_title" ActionTag="84736847" Tag="141" RotationSkewX="0" RotationSkewY="0" LeftMargin="283.5" RightMargin="283.5" TopMargin="-10" BottomMargin="448" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="32" X="109" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="337" Y="462" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="21" G="74" R="41" />
                <ShadowColor A="255" B="0" G="0" R="0" />
              </AbstractNodeData>
              <AbstractNodeData Name="tips_txt" ActionTag="146949246" Tag="142" RotationSkewX="0" RotationSkewY="0" LeftMargin="67.400002" RightMargin="67.400002" TopMargin="237" BottomMargin="119" FontSize="22" LabelText="---" IsCustomSize="True" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="110" X="539.200012" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="337" Y="174" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="34" G="83" R="149" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="0" />
                <ShadowColor A="255" B="0" G="0" R="0" />
              </AbstractNodeData>
              <AbstractNodeData Name="icon_sp" ActionTag="-458356256" Tag="143" RotationSkewX="0" RotationSkewY="0" LeftMargin="314" RightMargin="314" TopMargin="123" BottomMargin="297" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="46" X="46" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="337" Y="320" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
