<GameFile>
  <PropertyGroup Name="esercise_show_reward_window" Type="Layer" ID="kg4dxi7038wvyo5-l9nt61bpczerjmuqfs2a" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
        <Timeline ActionTag="35617124" Property="Position">
          <PointFrame FrameIndex="0" X="360.000000" Y="640.000000">
            <EasingData Type="0" />
          </PointFrame>
        </Timeline>
        <Timeline ActionTag="35617124" Property="Scale">
          <ScaleFrame FrameIndex="0" X="1.000000" Y="1.000000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="35617124" Property="RotationSkew">
          <ScaleFrame FrameIndex="0" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="35617124" Property="Alpha">
          <IntFrame FrameIndex="0" Value="255">
            <EasingData Type="0" />
          </IntFrame>
        </Timeline>
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="-447703528" Tag="53" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" ComboBoxIndex="1" BackColorAlpha="178" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
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
          <AbstractNodeData Name="main_container" ActionTag="35617124" Tag="54" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" BackColorAlpha="75" Scale9Enable="True" LeftEage="-14" RightEage="-14" TopEage="-39" BottomEage="-39" Scale9OriginX="-14" Scale9OriginY="-39" Scale9Width="28" Scale9Height="78" ctype="PanelObjectData">
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
            <Children>
              <AbstractNodeData Name="reward_layer" ActionTag="-228262355" Tag="105" RotationSkewX="0" RotationSkewY="0" LeftMargin="197.683594" RightMargin="202.316406" TopMargin="485.679291" BottomMargin="693.380676" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="100.940002" X="320" />
                <AnchorPoint ScaleX="1" ScaleY="1" />
                <Position X="517.683594" Y="794.320679" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="reward_bg" ActionTag="3667394" Tag="106" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="16" RightEage="16" TopEage="14" BottomEage="14" Scale9OriginX="16" Scale9OriginY="14" Scale9Width="17" Scale9Height="15" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="100.940002" X="320" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="160" Y="50.470001" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1092.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="item_container" ActionTag="-1399252282" Tag="107" RotationSkewX="0" RotationSkewY="0" LeftMargin="-49.999802" RightMargin="-50.000198" TopMargin="-7.53" BottomMargin="-7.53" TouchEnable="True" BackColorAlpha="109" IsBounceEnabled="True" ScrollDirectionType="Vertical_Horizontal" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ClipAble="True" ctype="ScrollViewObjectData">
                    <Size Y="116" X="420" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="160.000198" Y="50.470001" />
                    <Scale ScaleX="0.7" ScaleY="0.7" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="100" G="150" R="255" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="1" ScaleY="0" />
                    <SingleColor A="255" B="100" G="150" R="255" />
                    <InnerNodeSize Height="119" Width="650" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
