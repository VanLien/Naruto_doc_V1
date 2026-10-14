<GameFile>
  <PropertyGroup Name="role_achieve_window" Type="Layer" ID="erk12-x65atlj8b490zfqisuon3c7hpmyvdg" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="15" Speed="1.000000">
        <Timeline ActionTag="-466383353" Property="Position">
          <PointFrame FrameIndex="0" X="360.000000" Y="214.000000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="11" X="360.000000" Y="814.000000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="15" X="360.000000" Y="714.000000">
            <EasingData Type="0" />
          </PointFrame>
        </Timeline>
        <Timeline ActionTag="-466383353" Property="Scale">
          <ScaleFrame FrameIndex="0" X="1.000000" Y="1.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="11" X="1.000000" Y="1.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="15" X="1.000000" Y="1.000000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="-466383353" Property="RotationSkew">
          <ScaleFrame FrameIndex="0" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="11" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="15" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="-466383353" Property="Alpha">
          <IntFrame FrameIndex="0" Value="0">
            <EasingData Type="0" />
          </IntFrame>
          <IntFrame FrameIndex="11" Value="204">
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
          <AbstractNodeData Name="background" ActionTag="103780545" Tag="13" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" ComboBoxIndex="1" BackColorAlpha="178" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="0" G="0" R="0" />
          </AbstractNodeData>
          <AbstractNodeData Name="main_container" ActionTag="-466383353" Tag="14" RotationSkewX="0" RotationSkewY="0" LeftMargin="34.5" RightMargin="34.5" TopMargin="266" BottomMargin="414" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="600" X="651" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="714" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="bg" ActionTag="1565622808" Tag="39" RotationSkewX="0" RotationSkewY="0" LeftMargin="305" RightMargin="300" TopMargin="333" BottomMargin="221" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="46" X="46" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="328" Y="244" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="name" ActionTag="-764252815" Tag="44" RotationSkewX="0" RotationSkewY="0" LeftMargin="260" RightMargin="260" TopMargin="358" BottomMargin="214" FontSize="26" LabelText="Text Label" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="28" X="131" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="325.5" Y="228" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="67" G="176" R="233" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="desc" ActionTag="1050953" Tag="45" RotationSkewX="0" RotationSkewY="0" LeftMargin="274" RightMargin="274" TopMargin="397" BottomMargin="181" FontSize="20" LabelText="Text Label" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="22" X="103" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="325.5" Y="192" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="183" G="232" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="share_btn" ActionTag="394623957" Tag="40" RotationSkewX="0" RotationSkewY="0" LeftMargin="408.25" RightMargin="82.75" TopMargin="502.499908" BottomMargin="36.500099" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="23" BottomEage="23" Scale9OriginX="17" Scale9OriginY="23" Scale9Width="30" Scale9Height="18" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="61" X="160" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="488.25" Y="67.000099" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1018.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="1829856916" Tag="41" RotationSkewX="0" RotationSkewY="0" LeftMargin="49" RightMargin="49" TopMargin="14.5" BottomMargin="14.5" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="32" X="62" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="80" Y="30.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="21" G="74" R="41" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="close_btn" ActionTag="1126096219" Tag="42" RotationSkewX="0" RotationSkewY="0" LeftMargin="102.279999" RightMargin="388.720001" TopMargin="500.579803" BottomMargin="35.4202" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="21" BottomEage="21" Scale9OriginX="17" Scale9OriginY="21" Scale9Width="30" Scale9Height="21" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="64" X="160" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="182.279999" Y="67.420197" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1017.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="1192988565" Tag="43" RotationSkewX="0" RotationSkewY="0" LeftMargin="49.5" RightMargin="49.5" TopMargin="16" BottomMargin="16" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="32" X="61" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="80" Y="32" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="25" G="69" R="118" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
          <AbstractNodeData Name="action_1" ActionTag="841645475" Tag="40" RotationSkewX="0" RotationSkewY="0" LeftMargin="310" RightMargin="310" TopMargin="495" BottomMargin="685" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="100" X="100" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="735" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
